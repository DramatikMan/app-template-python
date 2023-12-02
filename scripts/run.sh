#!/bin/bash
export $(cat values.env | xargs) && pdm run $1
