import numpy as np
import pandas as pd

np.random.seed(42)

N = 5000

lead = np.random.randint(0, 256, N)
arsenic = np.random.randint(0, 256, N)
cadmium = np.random.randint(0, 256, N)
chromium = np.random.randint(0, 256, N)
mercury = np.random.randint(0, 256, N)

score = (
    0.30 * lead +
    0.25 * arsenic +
    0.15 * cadmium +
    0.20 * chromium +
    0.10 * mercury
)

label = (score > 120).astype(int)

df = pd.DataFrame({
    "lead": lead,
    "arsenic": arsenic,
    "cadmium": cadmium,
    "chromium": chromium,
    "mercury": mercury,
    "label": label
})

df.to_csv("dataset/heavy_metal_dataset.csv", index=False)

print("Dataset created successfully.")