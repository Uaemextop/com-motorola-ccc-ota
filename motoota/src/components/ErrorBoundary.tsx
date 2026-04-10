import { Component, type ReactNode } from 'react';

interface Props {
  children: ReactNode;
}

interface State {
  hasError: boolean;
  error: Error | null;
}

class ErrorBoundary extends Component<Props, State> {
  state: State = { hasError: false, error: null };

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error };
  }

  handleClearStorage = () => {
    try {
      localStorage.removeItem('motoota-config');
    } catch {
      // Ignore
    }
    window.location.reload();
  };

  render() {
    if (this.state.hasError) {
      return (
        <div className="flex min-h-screen items-center justify-center bg-[#0a0a14] p-6">
          <div className="max-w-md space-y-4 rounded-2xl border border-red-500/20 bg-red-500/5 p-6 text-center">
            <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-full bg-red-500/10">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-7 w-7 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <h2 className="text-lg font-semibold text-red-400">Algo salió mal</h2>
            <p className="text-sm text-gray-400">{this.state.error?.message}</p>
            <div className="flex flex-col gap-2">
              <button
                onClick={() => {
                  this.setState({ hasError: false, error: null });
                  window.location.reload();
                }}
                className="rounded-xl bg-red-500/20 px-6 py-2.5 text-sm font-medium text-red-300 transition-colors hover:bg-red-500/30"
              >
                Recargar aplicación
              </button>
              <button
                onClick={this.handleClearStorage}
                className="rounded-xl border border-white/10 px-6 py-2 text-xs text-gray-500 transition-colors hover:bg-white/5 hover:text-gray-300"
              >
                Limpiar datos y recargar
              </button>
            </div>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary;
