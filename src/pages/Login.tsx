import React, { useState } from "react";

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");

    try {
      const response = await fetch("http://localhost/ProyectoCloud/login.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await response.json();
      if (data.success) {
        alert("Login exitoso");
      } else {
        setError("Correo o contraseña incorrectos");
      }
    } catch (err) {
      setError("Error de conexión");
    }
  };

  return (
    <div
      style={{
        minHeight: "100vh",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        background: "#f5f5f5",
      }}
    >
      <form
        onSubmit={handleSubmit}
        style={{
          background: "#fff",
          padding: "40px 32px",
          borderRadius: "12px",
          boxShadow: "0 4px 24px rgba(0,0,0,0.12)",
          display: "flex",
          flexDirection: "column",
          minWidth: "350px",
        }}
      >
        <h1 style={{ textAlign: "center", marginBottom: "24px", fontSize: "2rem" }}>Login</h1>
        <input
          type="email"
          placeholder="Correo"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
          style={{ fontSize: "1.2rem", marginBottom: "16px", padding: "10px" }}
        />
        <input
          type="password"
          placeholder="Contraseña"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
          style={{ fontSize: "1.2rem", marginBottom: "16px", padding: "10px" }}
        />
        <button
          type="submit"
          style={{
            fontSize: "1.2rem",
            padding: "12px",
            background: "#1976d2",
            color: "#fff",
            border: "none",
            borderRadius: "6px",
            cursor: "pointer",
            marginBottom: "10px",
          }}
        >
          Iniciar sesión
        </button>
        {error && <p style={{ color: "red", textAlign: "center" }}>{error}</p>}
      </form>
    </div>
  );
}

export default Login;