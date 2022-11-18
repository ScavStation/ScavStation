#!/usr/bin/env python3

import os
import sys
import re

__author__ = "MistakeNot4892"
__version__ = "0.1.0"
__license__ = "MIT"

def main():

    # Make sure they gave us a map to replicate.
	if len(sys.argv) < 2:
		print("Specify a map to replicate.")
		return

    # Make sure we can access the maps folder.
	mapname = sys.argv[1]
	mapdir =  os.path.join("maps")
	if not os.path.isdir(mapdir):
		print("Cannot find directory '" + mapdir + "', make sure you are running this script from the root repository directory.")
		return

    # Work out what maps we actually need to replicate to.
    # This should be updated as map directories change, or the script will break.
	targetmaps = []
	ignoremaps = [
		"away",
		"away_sites_testing",
		"antag_spawn",
		"example",
		"modpack_testing",
		"random_ruins",
		"~mapsystem",
		"~unit_tests"
	]
	for dir in os.scandir(mapdir):
		if os.path.isdir(dir):
			targetmap = dir.path
			targetmap = targetmap.replace(mapdir + os.sep, "")
			if not targetmap in ignoremaps and targetmap != mapname:
				targetmaps.append(targetmap)

    # Make sure we can actually see the save directory.
	scrapedir = os.path.join("data", "player_saves")
	if not os.path.isdir(scrapedir):
		print("Cannot find directory '" + scrapedir + "', make sure you are running this script from the root repository directory.")
		return

    # Find existing saves for the target map, then replicate them to all our target map dirs.
    # If they exist already, don't copy over, just move on.
	print("Scanning saves in " + scrapedir + "...")
	saves_to_replicate = []
	for (root, dirs, files) in os.walk(scrapedir):
		for file in files:
			match = re.match(r"character_([a-zA-Z_]+)_(\d+)\.json", file, re.I)
			if not match:
				continue
			if match.group(1) != mapname:
				continue
			savefile = os.path.join(root, file)
			with open(savefile, "r") as loadedsave:
				wrote = 0
				print("Replicating " + file + "...")
				loadedlines = loadedsave.readlines()
				for targetmap in targetmaps:
					newfilename = savefile.replace(mapname, targetmap)
					if not os.path.exists(newfilename):
						with open(newfilename, "w") as writesave:
							for line in loadedlines:
								writesave.write(line)
							wrote = wrote+1
				print("Wrote " + str(wrote) + " copies.")

    # Fin.
	print("Done.")

if __name__ == "__main__":
	main()
