import { useState} from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game4() {
  const { unityProvider, sendMessage} = useUnityContext({
    loaderUrl: "/Juego 4.loader.js",
    dataUrl: "/Juego 4.data",
    frameworkUrl: "/Juego 4.framework.js",
    codeUrl: "/Juego 4.wasm",
  });

  const [nombre, setNombre] = useState("");

  function handleSceneRestart() {
    sendMessage("MenuManager", "ReloadScene");
  }

  function handleSubmit() {
    sendMessage("MenuManager", "RecibirNombre", nombre);
  }
  return (
    <div className="centered-container">
      <div className="centered-content">
        <h1 className="centered-title">React + Unity / Tecsup</h1>

        <Unity unityProvider={unityProvider} className="centered-unity" tabIndex={1} />

        <div className="centered-content" style={{ marginTop: "20px" }}>
          <input
            type="text"
            placeholder="Escribe tu nombre"
            value={nombre}
            onChange={(e) => setNombre(e.target.value)}
            tabIndex={2}
            style={{ padding: "10px", fontSize: "16px" }}
          />

          <button
            onClick={handleSubmit}
            style={{
              padding: "10px 20px",
              marginLeft: "10px",
              fontSize: "16px",
              cursor: "pointer",
            }}
          >
            Submit
          </button>
        </div>

        <div className="centered-content" style={{ marginTop: "20px" }}>
          <button onClick={handleSceneRestart}>Restart Game</button>
        </div>
      </div>
    </div>
  );
}

export default Game4;
