import {Unity, useUnityContext} from "react-unity-webgl";

function Game2() {
  const { unityProvider, sendMessage } = useUnityContext({

        loaderUrl: "/Juego Cartas Gozu.loader.js",
        dataUrl: "/Juego Cartas Gozu.data",
        frameworkUrl: "/Juego Cartas Gozu.framework.js",
        codeUrl: "/Juego Cartas Gozu.wasm",
    });


    function handleSceneRestart(){
      sendMessage("MenuManager", "ReloadScene")
  }

    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">React + Unity / Tecsup</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />

                    <div className="centered-content">
                        <button onClick={handleSceneRestart}>Restart Game</button>
                    </div>

                </div>
            </div>

        </>
    );
}


export default Game2