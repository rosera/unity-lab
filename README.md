# unity-lab
Dockerised unity installation using UnityHubSetup.AppImage

## Unity App Image
Download the Unity application installer from [here](https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.AppImage
)

Place it in the Docker build directory (important ensure it is called UnityHubSetup.AppImage). The app will then be copied across to the container image during the build process.


Make the installer executable:
```
chmod +x UnityHubSetup.AppImage
```

## Build the image
```
bash docker-build.sh
```

## Run the container over X11
```
bash docker-run.sh
```
