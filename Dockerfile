FROM android-base

RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter android-23
RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter platform-tools
RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter build-tools-23.0.2, build-tools-23.0.3
RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter extra-google-m2repository
