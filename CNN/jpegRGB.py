import pandas as pd
import os


directory = "../csvjpegRGB"

finaldf = pd.concat([pd.read_csv(f) for f in os.scandir(directory) ])
# df1 = pd.read_csv("../jpeg1.csv")
# df2 = pd.read_csv("../jpeg2.csv")
# df3 = pd.read_csv("../jpeg3.csv")

# finaldf = pd.concat([df1, df2, df3], axis=1, join='inner').sort_index()

finaldf.to_csv("./jpegRGB.csv")