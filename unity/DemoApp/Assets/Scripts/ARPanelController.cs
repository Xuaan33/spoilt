using UnityEngine;

public class ARPanelController : MonoBehaviour
{
    private static ARPanelController _instance;
    public static ARPanelController Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = FindObjectOfType<ARPanelController>();
            }

            return _instance;
        }
    }

    private void Awake()
    {
        if (_instance == null)
        {
            _instance = this;
        }
        else if (_instance != this)
        {
            Destroy(gameObject);
        }
    }

    public void SetPanelVisibility(bool visible)
    {
        gameObject.SetActive(visible);
    }
}