import {Unity, useUnityContext} from "react-unity-webgl";

function Game3() {
  const { unityProvider} = useUnityContext({

        loaderUrl: "/Tercer Juego Cloud.loader.js",
        dataUrl: "/Tercer Juego Cloud.data",
        frameworkUrl: "/Tercer Juego Cloud.framework.js",
        codeUrl: "/Tercer Juego Cloud.wasm",
    });
    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">React + Unity / Tecsup</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />

                    <div className="centered-content">
                    </div>

                </div>
            </div>

        </>
    );
}

export default Game3