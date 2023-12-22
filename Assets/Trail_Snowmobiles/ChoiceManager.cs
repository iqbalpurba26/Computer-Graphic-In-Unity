using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChoiceManager : MonoBehaviour
{
    public Material material; // Asumsikan material shader Anda terpasang di objek ini

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha0))
        {
            material.SetFloat("_choiceEnable", 0.0f);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            material.SetFloat("_choiceEnable", 1.0f);
        }
    
    }
}
