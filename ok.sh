#!/bin/bash

val=$(terraform plan)
$val
echo "Exit code was: $?"
