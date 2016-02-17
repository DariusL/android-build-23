FROM android-base

RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter android-23,platform-tools,build-tools-23.0.2,extra-android-m2repository,extra-google-google_play_services,extra-google-m2repository
