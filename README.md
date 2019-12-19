# unity-lab
Dockerised unity installation using UnityHubSetup.AppImage

## Unity App Image
Download the Unity application installer from [here](https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage)

Place it in the Docker build directory (important ensure it is called UnityHub.AppImage). The app will then be copied across to the container image during the build process.

Make the installer executable:
```
chmod +x UnityHub.AppImage
```


