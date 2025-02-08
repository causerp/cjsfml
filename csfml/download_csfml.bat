@echo off
git clone --branch 2.6.1 https://github.com/SFML/CSFML.git ./csfml
move /Y csfml\* .
rmdir /S /Q csfml
