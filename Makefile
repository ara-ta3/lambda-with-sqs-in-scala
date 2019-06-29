SBT=./tools/sbt/bin/sbt

sbt:
	$(SBT)

sbt/assembly:
	$(SBT) assembly
