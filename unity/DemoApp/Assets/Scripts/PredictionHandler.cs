using TMPro;
using UnityEngine;

public class PredictionHandler : MonoBehaviour
{
    public TextMeshProUGUI predictionText;
    public TextMeshProUGUI probabilityText;
    public TextMeshProUGUI safetyText;
    public TextMeshProUGUI nutritionFactText;

    public void SetPrediction(string prediction)
    {
        predictionText.text = "Prediction: " + prediction;

        if (prediction.ToLower().Contains("fresh"))
        {
            probabilityText.text = "Probability: 0%";
            safetyText.text = "Safety: Safe to consume";
        }
        else if (prediction.ToLower().Contains("rotten"))
        {
            probabilityText.text = "Probability: 100%";
            safetyText.text = "Safety: Please do not eat that!";
        }

        // Update NutritionFact based on prediction
        switch (prediction.ToLower())
        {
            case "apples":
                nutritionFactText.text = "Calories: 95\nCarbohydrates: 25 g\nFiber: 4 g\nSugars: 19 g\nProtein: 0 g\nFat: 0 g";
                break;
            case "banana":
                nutritionFactText.text = "Calories: 105\nProtein: 1.3 g\nFat: 0.4 g\nCarbohydrates: 27 g\nFiber: 3.1 g\nSugars: 14.4 g";
                break;
            case "carrot":
                nutritionFactText.text = "Calories: 25\nProtein: 0.6 g\nFat: 0.1 g\nCarbohydrates: 6 g\nFiber: 1.7 g\nSugars: 3 g";
                break;
            case "oranges":
                nutritionFactText.text = "Calories: 62\nProtein: 1.2 g\nCarbohydrates: 15.4 g\nFiber: 3.1 g\nSugars: 12.2 g\nFat: 0.2 g";
                break;
            case "tomato":
                nutritionFactText.text = "Calories: 22\nProtein: 1.1 g\nCarbohydrates: 4.8 g\nFiber: 1.5 g\nSugars: 3.2 g\nFat: 0.2 g";
                break;
            default:
                nutritionFactText.text = "";
                break;
        }
    }
}
