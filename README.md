# Image Enhancement & Morphological Processing

A collection of classical computer vision techniques implemented in MATLAB covering intensity transformations, histogram equalization, spatial filtering, and morphological operations with quantitative analysis.

## Overview

This project implements foundational image processing algorithms from scratch and using MATLAB built-in functions, with emphasis on understanding *why* each technique works through quantitative comparison. It covers two major areas: intensity-based enhancement (log/power-law transforms, histogram equalization) and spatial/morphological filtering (Laplacian sharpening, erosion, dilation, opening, median filtering).

Built for CS7367 (Machine Vision) at Kennesaw State University.

## Key Results

### Intensity Transformations
- Log transformation with optimal scaling constant c = 45.99 mapped Fourier spectrum from [0, 255] to visible dynamic range
- Gamma matching analysis found γ = 0.30 best approximates log transform (MSE = 28.38)
- Six gamma values tested (0.3, 0.5, 0.7, 1.0, 1.5, 2.0) demonstrating dark-expansion vs. bright-expansion behaviors

### Histogram Equalization
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Mean | 108.30 | 127.56 | +17.8% |
| Std Dev | 13.84 | 74.92 | **+441%** |
| Range | [0, 163] | [0, 255] | Full range |

### Morphological Processing
- Opening (erosion → dilation) successfully removed salt noise from binary images while preserving character shape
- Morphological filtering outperformed median filtering on structured binary images (fingerprint)
- Median filtering performed better on images with mixed noise types

### Laplacian Sharpening
- Enhanced lunar surface details by amplifying high-frequency edge information
- Quantitative before/after comparison of edge contrast

## Techniques Implemented

| Technique | Purpose | Key Parameters |
|-----------|---------|---------------|
| Log Transform | Compress dynamic range | c = 45.99 |
| Power-Law (Gamma) | Brightness adjustment | γ = 0.3 – 2.0 |
| Histogram Equalization | Contrast enhancement | — |
| Laplacian Filter | Edge sharpening | 3×3 kernel |
| Erosion / Dilation | Morphological primitives | disk SE, r=1–3 |
| Opening | Noise removal | erosion → dilation |
| Median Filter | Non-linear denoising | 3×3 – 5×5 window |

## Tech Stack

MATLAB, Image Processing Toolbox

## How to Run

Open `image_enhancement_lab.m` or `morphological_analysis.m` in MATLAB or a Jupyter notebook with MATLAB kernel.

```matlab
% Run from MATLAB command window
run('image_enhancement_lab.m')
run('morphological_analysis.m')
```

Ensure test images (`fourierspectrum.pgm`, `fingerprint_BW.png`, `morphology.png`, `moon.jpg`) are in the working directory.

## Files

- `image_enhancement_lab.m` — Log/power-law transforms and histogram equalization
- `morphological_analysis.m` — Morphological operators, median filtering, Laplacian sharpening

## License

MIT License
