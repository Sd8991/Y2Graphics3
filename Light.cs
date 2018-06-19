using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenTK;
using OpenTK.Graphics.OpenGL;

namespace Template_P3
{
    class Light
    {
        Shader shader;
        public Vector3 lightPos;
        public Vector3 lightCol;
        public string lightID;
        public string colorID;
        public int lightIDp;
        public int lightIDc;
        //public bool on;

        public Light(Vector3 lightPos, Vector3 lightCol, string lightID, string colorID, Shader shader, bool on)
        {
            this.lightPos = lightPos;
            this.lightID = lightID;
            if (!on) lightCol = Vector3.Zero;
            else this.lightCol = lightCol;
            this.colorID = colorID;
            this.shader = shader;
            lightIDp = GL.GetUniformLocation(shader.programID, lightID);
            lightIDc = GL.GetUniformLocation(shader.programID, colorID);
        }
    }
}
