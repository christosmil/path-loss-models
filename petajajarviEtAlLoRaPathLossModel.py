# author: Christos Milarokostas
# date: 2021/10/27
# --
# LoRa empirical path loss model based on measurements in Oulou
# "On the coverage of LPWANs: range evaluation and channel attenuation model for LoRa technology", J. Petajajarvi et al.

import math
from matplotlib import pyplot as plt

D_ZERO = 1000
PATH_LOSS_EXPONENT_GROUND = 2.32
PATH_LOSS_EXPONENT_WATER = 1.76
PATH_LOSS_INTERCEPT_GROUND = 128.95
PATH_LOSS_INTERCEPT_WATER = 126.43
DISTANCE_POINTS = 30000

def petajajarviEtAlLoRaModel(terrain, distance):
	if terrain == "ground":
		beta, n = PATH_LOSS_INTERCEPT_GROUND, PATH_LOSS_EXPONENT_GROUND
	elif terrain == "water":
		beta, n = PATH_LOSS_INTERCEPT_WATER, PATH_LOSS_EXPONENT_WATER
	
	expected_path_loss = [0]*DISTANCE_POINTS
	for i in range(DISTANCE_POINTS):
		expected_path_loss[i] = beta + 10*n*math.log(distance[i]/D_ZERO, 10)
	
	return expected_path_loss


def plotPetajajarviEtAlLoRaModel(expected_path_loss, terrain):
	plt.plot(expected_path_loss)
	if terrain == 'ground':
		x_lim_left = 2000
	elif terrain == 'water':
		x_lim_left = 5000
	plt.xlim(x_lim_left, DISTANCE_POINTS)
	plt.xscale('log')
	plt.xlabel('Distance (m)')
	plt.ylabel('Expected Path Loss (dB)')
	plt.title(f'Expected Path Loss Based on Petajajarvi et al. (WINNER+) model for {terrain=}')
	plt.grid('on')
	plt.show()
	

if __name__ == "__main__":
	terrain = None

	while terrain != "ground" and terrain != "water":
		terrain = input("Give terrain (ground/water): ")
	
	distance = [0]*DISTANCE_POINTS
	for i in range(DISTANCE_POINTS):
		distance[i] = i+1
	
	expected_path_loss = petajajarviEtAlLoRaModel(terrain, distance)
	
	plotPetajajarviEtAlLoRaModel(expected_path_loss, terrain)
