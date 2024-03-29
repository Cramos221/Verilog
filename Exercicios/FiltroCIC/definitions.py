import numpy as np
import random

# Fundamental frequency
f0 = 250 # Hz
w0 = 2*np.pi*f0
max_harmonic = 5

# Sampling frequency and period
fs = 16*max_harmonic*f0 # hz
Ts = 1/fs # s

# Define time limits
t_start = 0 # s
t_end = 6/f0 # s

# Select type of waveform
options = ["sum_of_harmonics", "sine", "impulse"]
wave_type = options[1]

def generate_wave(wave_type="sum_of_harmonics", t=0):
    wave_out = np.zeros(len(t))
    A_max = 260/2

    if (wave_type == "sum_of_harmonics"):
        for i in range(1, max_harmonic+1):
            A = random.randint(1, A_max) / i
            # theta = random.random() * 2*np.pi
            theta = 0
            wave_out += A * np.sin(i*w0*t + theta)
    
    if (wave_type == "sine"):
        theta = random.random() * 2*np.pi
        wave_out = A_max * np.sin(w0*t +theta)

    if (wave_type == "impulse"):
        wave_out[50] = A_max

    return wave_out
