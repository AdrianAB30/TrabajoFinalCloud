import {Unity, useUnityContext} from "react-unity-webgl";

function Game3() {
  const { unityProvider} = useUnityContext({

        loaderUrl: "/Juego 3.loader.js",
        dataUrl: "/Juego 3.data",
        frameworkUrl: "/Juego 3.framework.js",
        codeUrl: "/Juego 3.wasm",
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