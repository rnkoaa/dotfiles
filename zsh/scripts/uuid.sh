#!/bin/sh 

function gen_uuid() {
  uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' 
}

function gen_uuid2() {
  uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' | pbcopy
}
