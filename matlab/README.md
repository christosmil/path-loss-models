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
  - Stanford University Interim (SUI)

[^1]: For COST231-Hata model, there is an extra directory with further analysis and a documentation file (in Greek), since this was the model that I along with my colleague @delnektarios had to implement during a course on Wireless Links.
