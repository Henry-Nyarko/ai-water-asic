import joblib

model = joblib.load("ml/heavy_metal_model.pkl")

print("Weights:")
print(model.coef_[0])

print("\nBias:")
print(model.intercept_[0])