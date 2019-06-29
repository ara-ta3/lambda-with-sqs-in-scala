val commonSettings = Seq(
    version := "0.1-SNAPSHOT",
    scalaVersion := "2.12.8",
    conflictManager := ConflictManager.strict,
    scalacOptions ++= Seq(
        "-deprecation",
        "-feature",
        "-unchecked",
        "-language:implicitConversions",
        "-Xlint",
        "-Xfatal-warnings",
        "-Ywarn-numeric-widen",
        "-Ywarn-unused",
        "-Ywarn-unused-import",
        "-Ywarn-value-discard",
    ),
)

lazy val root = (project in file("."))
  .settings(commonSettings)
  .settings(
      name := "lambda-with-sqs-in-scala",
      libraryDependencies ++= Seq(
          "com.amazonaws" % "aws-lambda-java-core" % "1.0.0",
          "com.amazonaws" % "aws-lambda-java-events" % "1.1.0"
      )
  )
