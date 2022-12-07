#!/bin/sh

#https://customer-rtqpr9o38lod7dc9.cloudflarestream.com/3fba8dd8b1dea0be12e40c7dfd050565kf21252bba854bd6f054870e1a5a4c864/webRTC/publish
# Run command
./tigers-whip-client -u https://webrtc_middle_worker.tigercox.workers.dev -n true -f true -l 7 \
-A "audiotestsrc is-live=true wave=red-noise \
! audioconvert \
! audioresample \
! queue \
! opusenc \
! rtpopuspay pt=100 ssrc=1 \
! queue \
! application/x-rtp,media=audio,encoding-name=OPUS,payload=100" \
-V "videotestsrc is-live=true pattern=ball \
! video/x-raw,framerate=15/1,width=640,height=360 \
! queue \
! vp8enc \
! rtpvp8pay \
! taginject tags='title=\"MyTitle\",artist=\"MyArtist\"' \
! application/x-rtp,media=video,encoding-name=VP8,payload=96" \ 



#unused commands
# ! videoconvert \
# ! avenc_mpeg2video \
# ! videoconvert \
