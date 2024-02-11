index += 0.005;
index = index % 1;
y += animcurve_channel_evaluate(curve, index)*.1;
