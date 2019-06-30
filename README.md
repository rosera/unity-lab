# unity-lab
Dockerised unity installation using UnityHubSetup.AppImage

## Unity App Image
Download the Unity application installer from [here](https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.AppImage
)

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
