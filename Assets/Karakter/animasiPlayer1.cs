using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKey(KeyCode.Q))
        {
            GetComponent<Animator>().SetTrigger("jalan");
         }

        if(Input.GetKey(KeyCode.W))
        {
            GetComponent<Animator>().SetTrigger("lari");
         }

        if (Input.GetKey(KeyCode.E))
        {
            GetComponent<Animator>().SetTrigger("diam");
        }

    }
}
