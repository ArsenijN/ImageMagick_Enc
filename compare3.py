try:
    from skimage.metrics import structural_similarity
    import cv2
    import numpy as np
    import os
    import itertools
except:
    print("WARNING! Missing packages!")
    print("Program will be installed it automatically, to cancel press Ctrl+C")
    import os
    os.system("py -m pip install scikit-image")
    os.system("py -m pip install opencv-python")
    os.system("py -m pip install numpy")
    print("Packages now installed, exiting...")

'''
search_root_directory = os.getcwd()

# Recursively construct list of files under root directory. 
all_files_recursive = sum([[os.path.join(root, f) for f in files] for root, dirs, files in os.walk(search_root_directory)], [])

# Define function to tell if a given file is an image
# Example: search for .png extension.  
def is_an_image(fpath): 
    return os.path.splitext(fpath)[-1] in ('.png', '.jpg')
def is_an_image2(fpath): 
    return os.path.splitext(fpath)[-2] in ('.png', '.jpg')

# Take the first matching result. Note: throws StopIteration if not found
first_image_file = next(filter(is_an_image, all_files_recursive))
next_image_file = next(filter(is_an_image2, all_files_recursive))
#https://stackoverflow.com/questions/69143813/how-to-find-the-first-image-in-a-folder
'''
'''
#import os

# Get the current working directory
search_root_directory = os.getcwd()

# Construct list of files in the current directory (no recursion)
all_files = [os.path.join(search_root_directory, f) for f in os.listdir(search_root_directory) if os.path.isfile(os.path.join(search_root_directory, f))]

# Define function to tell if a given file is an image
def is_an_image(fpath): 
    return os.path.splitext(fpath)[-1].lower() in ('.png', '.jpg')

# Find the first matching image file
first_image_file = next(filter(is_an_image, all_files), None)

# Check if an image was found
if first_image_file:
    print(f"First image found: {first_image_file}")
else:
    print("No image files found.")
'''
import itertools

# Get the current working directory
search_root_directory = os.getcwd()

# Construct list of files in the current directory (no recursion)
all_files = [os.path.join(search_root_directory, f) for f in os.listdir(search_root_directory) if os.path.isfile(os.path.join(search_root_directory, f))]

# Define function to tell if a given file is an image
def is_an_image(fpath): 
    return os.path.splitext(fpath)[-1].lower() in ('.png', '.jpg', '.jpeg', '.bmp', '.webp',)    #gif doesn't work?

# Find the first and second matching image files
image_files = list(itertools.islice(filter(is_an_image, all_files), 2))

# Check if images were found
first_image_file = image_files[0] if len(image_files) > 0 else None
next_image_file = image_files[1] if len(image_files) > 1 else None

# Output results
if first_image_file:
    print(f"First image found: {first_image_file}")
else:
    print("No image files found.")

if next_image_file:
    print(f"Second image found: {next_image_file}")
else:
    print("No second image file found.")

before = cv2.imread(first_image_file)
after = cv2.imread(next_image_file)

# Convert images to grayscale
before_gray = cv2.cvtColor(before, cv2.COLOR_BGR2GRAY)
after_gray = cv2.cvtColor(after, cv2.COLOR_BGR2GRAY)

# Compute SSIM between two images
(score, diff) = structural_similarity(before_gray, after_gray, full=True)
print("Image similarity", score)

# The diff image contains the actual image differences between the two images
# and is represented as a floating point data type in the range [0,1] 
# so we must convert the array to 8-bit unsigned integers in the range
# [0,255] before we can use it with OpenCV
diff = (diff * 255).astype("uint8")

# Threshold the difference image, followed by finding contours to
# obtain the regions of the two input images that differ
thresh = cv2.threshold(diff, 0, 255, cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
contours = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
contours = contours[0] if len(contours) == 2 else contours[1]

mask = np.zeros(before.shape, dtype='uint8')
filled_after = after.copy()

for c in contours:
    area = cv2.contourArea(c)
    if area > 40:
        x,y,w,h = cv2.boundingRect(c)
        cv2.rectangle(before, (x, y), (x + w, y + h), (36,255,12), 2)
        cv2.rectangle(after, (x, y), (x + w, y + h), (36,255,12), 2)
        cv2.drawContours(mask, [c], 0, (0,255,0), -1)
        cv2.drawContours(filled_after, [c], 0, (0,255,0), -1)

cv2.imshow('before', before)
cv2.imshow('after', after)
cv2.imshow('diff',diff)
cv2.imshow('mask',mask)
cv2.imshow('filled after',filled_after)
cv2.waitKey(0)
#https://stackoverflow.com/questions/71567315/how-to-get-the-ssim-comparison-score-between-two-images