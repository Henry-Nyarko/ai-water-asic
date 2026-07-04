import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix
import joblib

# Load dataset
df = pd.read_csv("dataset/heavy_metal_dataset.csv")

X = df[["lead", "arsenic", "cadmium", "chromium", "mercury"]]
y = df["label"]

# Split data
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

# Train model
model = LogisticRegression(max_iter=1000)
model.fit(X_train, y_train)

# Evaluate
pred = model.predict(X_test)

print(f"Accuracy: {accuracy_score(y_test, pred):.4f}")
print("\nConfusion Matrix:")
print(confusion_matrix(y_test, pred))

# Save model
joblib.dump(model, "ml/heavy_metal_model.pkl")

print("\nModel saved to ml/heavy_metal_model.pkl")