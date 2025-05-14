import { useEffect } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game1() {
    const { unityProvider, unload, sendMessage } = useUnityContext({
        loaderUrl: "/Juego 1.loader.js",
        dataUrl: "/Juego 1.data",
        frameworkUrl: "/Juego 1.framework.js",
        codeUrl: "/Juego 1.wasm",
    });

  
   useEffect(() => {
    return () => {
      sendMessage("Audio Manager", "StopMusic"); 
      unload()
        .then(() => console.log("✅ Game1 descargado correctamente"))
        .catch((err) => console.error("❌ Error al descargar Game1:", err));
    };
  }, []);

    return (
        <div className="centered-container">
            <div className="centered-content">
                <h1 className="centered-title">React + Unity / Tecsup</h1>
                <Unity unityProvider={unityProvider} className="centered-unity" />
            </div>
        </div>
    );
}

export default Game1;
