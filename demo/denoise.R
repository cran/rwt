#
# DENOISE.R - Demo
#

cat("************************************\n");
cat("Loading 'rwt' package...\n");
library("rwt")

cat("************************************\n");
cat("Creating doppler signal for test\n");

sig <- makesig(SIGNAL.DOPPLER);
s <- as.vector(sig$x);
N <- sig$N;
n <- rnorm(N);

x <- s + n/10;     # (approximately 10dB SNR)

cat("Get Daubechies's scaling filter\n");
h <- daubcqf(8)$h.0;

# Denoise x with the default method based on the DWT
cat("Denoise signal using DWT\n");
#debug(.dwt)
#debug(mdwt)
#debug(midwt)
ret.dwt <- denoise.dwt(x, h);
xd <- ret.dwt$xd;
xn <- ret.dwt$xn;
opt1 <- ret.dwt$option;

# Denoise x using the undecimated (LSI) wavelet transform
cat("Denoise signal using UDWT\n");
#debug(.udwt)
#debug(mrdwt)
#debug(mirdwt)
ret.udwt <- denoise.udwt(x, h);
yd <- ret.udwt$xd;
yn <- ret.udwt$xn;
opt2 <- ret.udwt$option;

# Plot results
cat("Plot results\n");
X11();
plotSignalTransformation(x, s, "Original");
X11();
plotSignalTransformation(xd, s, "Decimated Wavelet Transform");
X11();
plotSignalTransformation(yd, s, "Undecimated Wavelet Transform");

