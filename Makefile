SBT=./tools/sbt/bin/sbt
AWS=aws
function_name=lambda-in-scala

sbt:
	$(SBT)

sbt/assembly:
	$(SBT) assembly

update_code:
	$(AWS) lambda update-function-code --function-name $(function_name) --zip-file "fileb://target/scala-2.12/lambda-with-sqs-in-scala-assembly-0.1-SNAPSHOT.jar"
