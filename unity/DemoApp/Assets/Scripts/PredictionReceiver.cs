using UnityEngine;
using TMPro;

public class PredictionReceiver : MonoBehaviour
{
    public TextMeshPro predictionText;

    void Start()
    {
        // Call the method in Flutter to start receiving messages
        AndroidJavaClass unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
        AndroidJavaObject currentActivity = unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
        AndroidJavaObject flutterIntegration = new AndroidJavaObject("com.fyp.spoilt.FlutterIntegration"); // Replace 'your.package.name.FlutterIntegration' with your Flutter integration class
        flutterIntegration.Call("startListeningForMessages", currentActivity);
    }

    // Method to receive messages from Flutter
    public void ReceiveMessageFromFlutter(string message)
    {
        // Display the prediction in the AR Panel
        predictionText.text = message;
    }
}
