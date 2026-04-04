import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useTheme } from "../../hooks/useTheme";
import publicApi from "../../api/publicClient";

const F = "'Plus Jakarta Sans', sans-serif";

function FlowpathMark({ blue }) {
  return (
    <svg width="44" height="44" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect width="36" height="36" rx="9" fill={blue} />
      <circle cx="9" cy="20" r="4.5" fill="white" />
      <circle cx="18" cy="13" r="3" fill="white" fillOpacity="0.55" />
      <circle cx="27" cy="20" r="4.5" fill="white" />
      <circle cx="27" cy="20" r="1.8" fill={blue} />
      <path d="M13 17.5 Q18 9 23 17.5" stroke="white" strokeWidth="2" strokeLinecap="round" fill="none" />
    </svg>
  );
}

export default function ForgotPasswordPage() {
  const { theme } = useTheme();
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);
    try {
      const { data } = await publicApi.post("/v1/users/password-reset/", { email });
      navigate(`/reset-password?token=${data.token}`);
    } catch (err) {
      setError(err.response?.data?.detail || "Something went wrong. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  const inputStyle = {
    width: "100%",
    padding: "11px 14px",
    border: `1.5px solid ${theme.borderInput}`,
    borderRadius: 10,
    fontSize: 14,
    fontFamily: F,
    color: theme.text,
    background: theme.inputBg,
    outline: "none",
    boxSizing: "border-box",
    transition: "border-color 0.15s, box-shadow 0.15s",
  };

  return (
    <div style={{
      minHeight: "100vh",
      background: theme.bg,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      padding: 24,
    }}>
      <div style={{ width: "100%", maxWidth: 400 }}>

        <div style={{ textAlign: "center", marginBottom: 36 }}>
          <div style={{ display: "inline-flex", flexDirection: "column", alignItems: "center", gap: 10 }}>
            <FlowpathMark blue={theme.blue} />
            <div>
              <span style={{ fontSize: 22, fontWeight: 800, color: theme.text, fontFamily: F, letterSpacing: "-0.04em" }}>flow</span>
              <span style={{ fontSize: 22, fontWeight: 800, color: theme.blue, fontFamily: F, letterSpacing: "-0.04em" }}>path</span>
            </div>
            <p style={{ margin: 0, fontSize: 13, color: theme.textFaint, fontFamily: F }}>Workflow Intelligence</p>
          </div>
        </div>

        <div style={{
          background: theme.surface,
          border: `1px solid ${theme.border}`,
          borderRadius: 14,
          padding: "32px 28px",
          boxShadow: "0 2px 12px rgba(0,0,0,0.08)",
        }}>
          <h1 style={{ margin: "0 0 6px", fontSize: 22, fontFamily: "'Fraunces', serif", color: theme.text }}>
            Forgot password?
          </h1>
          <p style={{ margin: "0 0 24px", fontSize: 13, color: theme.textMuted, fontFamily: F }}>
            Enter your email to reset your password.
          </p>

          {error && (
            <div style={{
              padding: "11px 14px",
              background: "#FEF2F2",
              border: "1px solid #FECACA",
              borderRadius: 8,
              marginBottom: 18,
              fontSize: 13,
              color: "#DC2626",
              fontFamily: F,
            }}>
              {error}
            </div>
          )}

          <form onSubmit={handleSubmit}>
            <div style={{ marginBottom: 20 }}>
              <label style={{ display: "block", fontSize: 13, fontWeight: 600, color: theme.text, fontFamily: F, marginBottom: 6 }}>
                Email
              </label>
              <input
                type="email"
                required
                autoComplete="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="you@company.com"
                style={inputStyle}
                onFocus={(e) => { e.target.style.borderColor = theme.blue; e.target.style.boxShadow = `0 0 0 3px ${theme.blueLight}`; }}
                onBlur={(e) => { e.target.style.borderColor = theme.borderInput; e.target.style.boxShadow = "none"; }}
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              style={{
                width: "100%",
                padding: "12px",
                background: loading ? theme.blueSubtle : theme.blue,
                border: "none",
                borderRadius: 10,
                color: "#fff",
                fontSize: 14,
                fontWeight: 700,
                fontFamily: F,
                cursor: loading ? "not-allowed" : "pointer",
                transition: "background 0.15s",
                marginBottom: 16,
              }}
            >
              {loading ? "Verifying…" : "Continue"}
            </button>
          </form>

          <p style={{ margin: 0, textAlign: "center", fontSize: 13, color: theme.textMuted, fontFamily: F }}>
            <Link to="/login" style={{ color: theme.blue, fontWeight: 600 }}>
              ← Back to sign in
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
}
