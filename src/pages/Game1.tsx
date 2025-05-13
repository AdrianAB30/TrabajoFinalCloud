import {Unity, useUnityContext} from "react-unity-webgl";

function Game() {
    const { unityProvider, sendMessage } = useUnityContext({
    loaderUrl: "/Juego 1.loader.js",
    dataUrl: "/Juego 1.data",
    frameworkUrl: "/Juego 1.framework.js",
    codeUrl: "/Juego 1.wasm",
    });

    function handleClickSpawnEnemies() {
        sendMessage("GameObject", "SpawnEnemies");
    }

    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">React + Unity / Tecsup</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />

                    <div className="centered-content">
                        <button onClick={handleClickSpawnEnemies}>Spawn Enemies</button>
                    </div>

                </div>
            </div>

        </>
    );
}


export default Game