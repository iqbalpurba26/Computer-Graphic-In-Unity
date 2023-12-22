using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MyMaterialManager : MonoBehaviour
{
    public Material normalMaterial;

    public Material warningMaterial;

    private MeshRenderer ren;

    [Range(0f, 100f)]
    public float currentHealth;

    void Start()
    {
        ren = GetComponent<MeshRenderer>();

        ren.material = warningMaterial;

        currentHealth = 40;

    }

    // Update is called once per frame
    void Update()
    {
        if (currentHealth < 50)
        {
            ren.material = warningMaterial;

            float warningDeltaTime = Mathf.Lerp(0.1f, 0.2f, currentHealth / 50.0f);
            ren.material.SetFloat("_DeltaTime", warningDeltaTime);
        }
        else
        {
            ren.material = normalMaterial;
        }

    }
}
