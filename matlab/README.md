# Path Loss Models in MATLAB

This directory contains MATLAB functions for calculating path loss via empirical channel models or via analytical approaches, along with their corresponding figures. The scripts were written as an extension of my undergraduate thesis, during early fall 2018. This work was higly relied on the textbook ["Mobile Communication Systems," Philip Constantinou, Athanasios Kanatas, George Pantos, 2014, 2nd Edition, Papasotiriou Publications](https://ekdoseis-papasotiriou.gr/products/9789604910861-konstantinou-filippos-sustimata-kiniton-epikoinonion-2i-ekdosi) (translation from original Greek title).

Models that were studied include:
- Analytical models
  - Free space
  - Knife edge diffraction
  - Plane earth
  - Rounded obstacle diffraction
- Empirical models
  - Building penetration
  - COST231-Hata[^1]
  - Cost231-MWM
  - Walfisch-Ikegami
  - Egli
  - IEEE 802.16
  - ITU-R P.1238
  - Keenan-Motley
  - Log distance indoor
  - Log distance outdoor
  - Okumura-Hata
  - Simple linear
  - WINNER II

## Tree structure of directory
```bash
.
├── BuildingPenetration.fig
├── BuildingPenetration.jpg
├── BuildingPenetration.m
├── BuildingPenetrationPlot.m
├── COST231HataModel.m
├── COST231HataModel1.fig
├── COST231HataModel1.jpg
├── COST231HataModel2.fig
├── COST231HataModel2.jpg
├── COST231HataModel3.fig
├── COST231HataModel3.jpg
├── COST231HataModelPlot.m
├── COST231MWMModel.m
├── COST231MWMModel1.fig
├── COST231MWMModel1.jpg
├── COST231MWMModel2.fig
├── COST231MWMModel2.jpg
├── COST231MWMModelPlot.m
├── COST231WalfischIkegamiModel.m
├── COST231WalfischIkegamiModel1.fig
├── COST231WalfischIkegamiModel1.jpg
├── COST231WalfischIkegamiModel2.fig
├── COST231WalfischIkegamiModel2.jpg
├── COST231WalfischIkegamiModelPlot.m
├── COST231Hata
│   ├── FINAL1.fig
│   ├── FINAL1.png
│   ├── FINAL2.fig
│   ├── FINAL2.png
│   ├── base_station_height(m).fig
│   ├── base_station_height(m).png
│   ├── base_station_height(m)_log.fig
│   ├── base_station_height(m)_log.png
│   ├── base_station_height_final(m).fig
│   ├── base_station_height_final(m).png
│   ├── cost231_Hata.m
│   ├── cost231_HataPlot.m
│   ├── distance(m).fig
│   ├── distance(m).png
│   ├── distance(m)_log.fig
│   ├── distance(m)_log.png
│   ├── fc(MHz).fig
│   ├── fc(MHz).png
│   ├── fc(dB(MHz)).fig
│   ├── fc(dB(MHz)).png
│   ├── mobile_station_height(m).fig
│   ├── mobile_station_height(m).png
│   ├── mobile_station_height_final(m).fig
│   ├── mobile_station_height_final(m).png
│   └── Ασύρματες Ζεύξεις [Εργασία 1].pdf
├── EgliModel.fig
├── EgliModel.jpg
├── EgliModel.m
├── EgliModelPlot.m
├── FreeSpaceModel.fig
├── FreeSpaceModel.jpg
├── FreeSpaceModel.m
├── FreeSpaceModelPlot.m
├── IEEE80216Model.m
├── IEEE80216Model1.fig
├── IEEE80216Model1.jpg
├── IEEE80216Model2.fig
├── IEEE80216Model2.jpg
├── IEEE80216Model3.fig
├── IEEE80216Model3.jpg
├── IEEE80216ModelPlot.m
├── ITURP1238Model.m
├── ITURP1238Model1.fig
├── ITURP1238Model1.jpg
├── ITURP1238Model2.fig
├── ITURP1238Model2.jpg
├── ITURP1238ModelPlot.m
├── KeenanMotleyModel.m
├── KeenanMotleyModel1.fig
├── KeenanMotleyModel1.jpg
├── KeenanMotleyModel2.fig
├── KeenanMotleyModel2.jpg
├── KeenanMotleyModelPlot.m
├── KnifeEdgeDiffraction.fig
├── KnifeEdgeDiffraction.jpg
├── KnifeEdgeDiffraction.m
├── KnifeEdgeDiffraction2.m
├── KnifeEdgeDiffractionPlot.m
├── LogDistanceINDOORModel.m
├── LogDistanceINDOORModelPlot.m
├── LogDistanceModelINDOOR.fig
├── LogDistanceModelINDOOR.jpg
├── LogDistanceModelOUTDOOR1.fig
├── LogDistanceModelOUTDOOR1.jpg
├── LogDistanceModelOUTDOOR2.fig
├── LogDistanceModelOUTDOOR2.jpg
├── LogDistanceOUTDOORModel.m
├── LogDistanceOUTDOORModelPlot.m
├── OkumuraHataModel.m
├── OkumuraHataModel1.fig
├── OkumuraHataModel1.jpg
├── OkumuraHataModel2.fig
├── OkumuraHataModel2.jpg
├── OkumuraHataModel3.fig
├── OkumuraHataModel3.jpg
├── OkumuraHataModelPlot.m
├── PlaneEarthModel.m
├── PlaneEarthModel1.fig
├── PlaneEarthModel1.jpg
├── PlaneEarthModel2.fig
├── PlaneEarthModel2.jpg
├── PlaneEarthModelPlot.m
├── README.md
├── RoundedObstacleDiffraction.fig
├── RoundedObstacleDiffraction.jpg
├── RoundedObstacleDiffraction.m
├── RoundedObstacleDiffractionPlot.m
├── SimpleLinearModel.m
├── SimpleLinearModel1.fig
├── SimpleLinearModel1.jpg
├── SimpleLinearModel2.fig
├── SimpleLinearModel2.jpg
├── SimpleLinearModelPlot.m
├── WINNERIIModel.fig
├── WINNERIIModel.jpg
├── WINNERIIModel.m
└── WINNERIIModelPlot.m
```

[^1]: For COST231-Hata model, there is an extra directory with further analysis and a documentation file (in Greek), since this was the model that I along with my colleague @delnektarios had to implement during a course on Wireless Links.
