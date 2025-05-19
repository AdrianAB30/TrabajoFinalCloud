import { useState, useCallback, useEffect } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game2() {
    const [isGameOver, setIsGameOver] = useState<boolean>(true);
    const [userName, setUserName] = useState<string | undefined>();
    const [score, setScore] = useState<number | undefined>();
    const [nombre, setName] = useState<string>("");

    const { unityProvider, addEventListener, removeEventListener, sendMessage } =
        useUnityContext({
            loaderUrl: "Juego 5.loader.js",
            dataUrl: "Juego 5.data",
            frameworkUrl: "Juego 5.framework.js",
            codeUrl: "Juego 5.wasm",
        });

    const handleGameOver = useCallback((...params: any[]) => {
        const [userName, score] = params;
        setIsGameOver(true);
        setUserName(userName);
        setScore(Number(score));
        console.log("GameOver event params:", params);
    }, []);

    useEffect(() => {
        addEventListener("GameOver", handleGameOver);
        return () => {
            removeEventListener("GameOver", handleGameOver);
        };
    }, [handleGameOver]);

    const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setName(e.target.value);
    };

    const sendName = () => {
        sendMessage("MenuManager", "RecibirNombre", nombre);
    };

    const resetScene = () => {
        sendMessage("MenuManager", "ReloadScene");
        setIsGameOver(false);
        setScore(undefined);
        setUserName(undefined);
    };

    return (
        <div className="centered-container">
            <div className="centered-content">
                <h1 className="centered-title">React + Unity / Tecsup</h1>
                <Unity unityProvider={unityProvider} className="centered-unity" tabIndex={1} />
                <div className="input-container" style={{ marginTop: "10px" }}>
                    <input
                        type="text"
                        value={nombre}
                        onChange={handleInputChange}
                        placeholder="Escribe tu nombre"
                        style={{ padding: "5px", marginRight: "5px" }}
                    />
                    <button onClick={sendName} style={{ padding: "5px", marginRight: "5px" }}>
                        Enviar Nombre
                    </button>
                    <button onClick={resetScene} style={{ padding: "5px" }}>
                        Reiniciar Juego
                    </button>
                </div>
                {isGameOver && (
                    <p>{`Game Over ${userName}! Has conseguido ${score} puntos.`}</p>
                )}
            </div>
        </div>
    );
}

export default Game2;