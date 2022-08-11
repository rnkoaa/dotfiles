#!/bin/sh

function dt(){
  date +"%Y-%m-%dT%H:%M:%S.000Z" | tr -d '\n' 
}
