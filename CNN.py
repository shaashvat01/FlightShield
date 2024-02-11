import pandas as pd
import numpy as np
from PIL import Image
from sklearn.model_selection import train_test_split
import os

# Configuration
dataset_dir = '/Users/shaashvatmittal/Downloads/Drone_Stanford_Smaller_Datset'
annotations_path = os.path.join(dataset_dir, 'annotations', 'annotations.txt')

# Load annotations
# The delimiter seems to be a space, and the quoting character seems to be a double-quote for the class name
annotations = pd.read_csv(annotations_path, delimiter=' ', quotechar='"', names=['frame', 'x_min', 'y_min', 'x_max', 'y_max', 'id', 'flag1', 'flag2', 'flag3', 'class'])

# Placeholder lists for images and labels
images = []
labels = []

# Process each image
for _, row in annotations.iterrows():
    image_filename = f"{row['frame']}.jpg"  # Assuming the frame corresponds to the image filename
    image_path = os.path.join(dataset_dir, image_filename)

    try:
        # Open and resize the image
        with Image.open(image_path) as img:
            img_resized = img.resize((224, 224))
            images.append(np.array(img_resized) / 255.0)  # Normalize pixel values
            labels.append(row['class'])
    except FileNotFoundError:
        print(f"File not found: {image_path}")
    except Exception as e:
        print(f"Error processing image {image_path}: {e}")

# Convert lists to NumPy arrays
images = np.array(images)
labels = np.array(labels)

# Split the dataset
train_images, test_images, train_labels, test_labels = train_test_split(images, labels, test_size=0.2, random_state=42)
val_images, test_images, val_labels, test_labels = train_test_split(test_images, test_labels, test_size=0.5, random_state=42)

# Optionally, save your datasets to disk for later use
# np.save('/path/to/save/train_images.npy', train_images)
# np.save('/path/to/save/train_labels.npy', train_labels)
# np.save('/path/to/save/val_images.npy', val_images)
# np.save('/path/to/save/val_labels.npy', val_labels)
# np.save('/path/to/save/test_images.npy', test_images)
# np.save('/path/to/save/test_labels.npy', test_labels)

print(f'Training set size: {len(train_images)}')
print(f'Validation set size: {len(val_images)}')
print(f'Test set size: {len(test_images)}')
