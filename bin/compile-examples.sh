#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# resolve links - $0 may be a softlink
THIS="$0"
while [ -h "$THIS" ]; do
  ls=`ls -ld "$THIS"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    THIS="$link"
  else
    THIS=`dirname "$THIS"`/"$link"
  fi
done

# some directories
THIS_DIR=`dirname "$THIS"`
GORA_HOME=`cd "$THIS_DIR/.." ; pwd`

MODULE=gora-core
DIR=$GORA_HOME/$MODULE/src/examples/avro/
OUTDIR=$GORA_HOME/$MODULE/src/examples/java
GORA_BIN=$GORA_HOME/bin/gora

# Preserve pacakge-info.java
mv $OUTDIR/org/apache/gora/examples/generated/package-info.java $OUTDIR/org/apache/gora/examples/generated-package-info.java.bck
rm -r $OUTDIR/org/apache/gora/examples/generated/*
mv $OUTDIR/org/apache/gora/examples/generated-package-info.java.bck $OUTDIR/org/apache/gora/examples/generated/package-info.java

for f in `ls $DIR` ; do
  echo "Compiling $DIR$f"
  echo "Command: $GORA_BIN goracompiler $DIR$f $OUTDIR"
  $GORA_BIN goracompiler $DIR$f $OUTDIR 
done


# GORACI

MODULE=gora-goraci
DIR=$GORA_HOME/$MODULE/src/main/avro/
OUTDIR=$GORA_HOME/$MODULE/src/main/java
GORA_BIN=$GORA_HOME/bin/gora

# Preserve pacakge-info.java
mv $OUTDIR/org/apache/gora/goraci/generated/package-info.java $OUTDIR/org/apache/gora/goraci/generated-package-info.java.bck
rm -r $OUTDIR/org/apache/gora/goraci/generated/*
mv $OUTDIR/org/apache/gora/goraci/generated-package-info.java.bck $OUTDIR/org/apache/gora/goraci/generated/package-info.java

for f in `ls $DIR` ; do
  echo "Compiling $DIR$f"
  echo "Command: $GORA_BIN goracompiler $DIR$f $OUTDIR"
  $GORA_BIN goracompiler $DIR$f $OUTDIR 
done


# TUTORIAL

MODULE=gora-tutorial
DIR=$GORA_HOME/$MODULE/src/main/avro/
OUTDIR=$GORA_HOME/$MODULE/src/main/java
GORA_BIN=$GORA_HOME/bin/gora

# Preserve pacakge-info.java
mv $OUTDIR/org/apache/gora/tutorial/log/generated/package-info.java $OUTDIR/org/apache/gora/tutorial/log/generated-package-info.java.bck
rm -r $OUTDIR/org/apache/gora/tutorial/log/generated/*
mv $OUTDIR/org/apache/gora/tutorial/log/generated-package-info.java.bck $OUTDIR/org/apache/gora/tutorial/log/generated/package-info.java

for f in `ls $DIR` ; do
  echo "Compiling $DIR$f"
  echo "Command: $GORA_BIN goracompiler $DIR$f $OUTDIR"
  $GORA_BIN goracompiler $DIR$f $OUTDIR 
done

# GORA-CASSANDRA

MODULE=gora-cassandra
DIR=$GORA_HOME/$MODULE/src/examples/avro/
OUTDIR=$GORA_HOME/$MODULE/src/examples/java
GORA_BIN=$GORA_HOME/bin/gora

# Preserve pacakge-info.java
mv $OUTDIR/org/apache/gora/cassandra/example/generated/AvroSerialization/package-info.java $OUTDIR/org/apache/gora/cassandra/example/generated/generated-package-info.java.bck
rm -r $OUTDIR/org/apache/gora/cassandra/example/generated/AvroSerialization/*
mv $OUTDIR/org/apache/gora/cassandra/example/generated/generated-package-info.java.bck $OUTDIR/org/apache/gora/cassandra/example/generated/AvroSerialization/package-info.java

for f in `ls $DIR` ; do
  echo "Compiling $DIR$f"
  echo "Command: $GORA_BIN goracompiler $DIR$f $OUTDIR"
  $GORA_BIN goracompiler $DIR$f $OUTDIR 
done
