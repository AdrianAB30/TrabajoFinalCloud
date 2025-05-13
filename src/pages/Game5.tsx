import {Unity, useUnityContext} from "react-unity-webgl";

function Game5() {
  const { unityProvider} = useUnityContext({

        loaderUrl: "/Juego 5.loader.js",
        dataUrl: "/Juego 5.data",
        frameworkUrl: "/Juego 5.framework.js",
        codeUrl: "/Juego 5.wasm",
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

export default Game5