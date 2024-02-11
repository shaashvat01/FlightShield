import pandas as pd
from PIL import Image
import numpy as np
from sklearn.model_selection import train_test_split
import os

# Configuration
dataset_dir = '/Users/shaashvatmittal/Downloads/Drone_Stanford_Smaller_Datset'
# Ensure this path points directly to your CSV file, including the filename
annotation_file = '/Users/shaashvatmittal/Downloads/Drone_Stanford_Smaller_Datset/annotations.csv'
output_size = (224, 224)

# Load annotations
annotations = pd.read_csv(annotation_file)

# Placeholder lists for images and labels
images = []
labels = []

# Process each image
for _, row in annotations.iterrows():
    image_path = os.path.join(dataset_dir, row['image_filename'])
    label = row['label']  # Adjust this if your CSV column name is different

    try:
        # Open and resize the image
        with Image.open(image_path) as img:
            img_resized = img.resize(output_size)
            images.append(np.array(img_resized) / 255.0)  # Normalize pixel values
            labels.append(label)
    except Exception as e:
        print(f"Error processing image {image_path}: {e}")

# Convert lists to NumPy arrays
images = np.array(images)
labels = np.array(labels)

# Split the dataset
train_images, test_images, train_labels, test_labels = train_test_split(images, labels, test_size=0.2, random_state=42)
val_images, test_images, val_labels, test_labels = train_test_split(test_images, test_labels, test_size=0.5, random_state=42)

# Optionally, save your datasets to disk for later use
# np.save('train_images.npy', train_images)
# np.save('train_labels.npy', train_labels)
# np.save('val_images.npy', val_images)
# np.save('val_labels.npy', val_labels)
# np.save('test_images.npy', test_images)
# np.save('test_labels.npy', test_labels)

print(f'Training set size: {len(train_images)}')
print(f'Validation set size: {len(val_images)}')
print(f'Test set size: {len(test_images)}')
