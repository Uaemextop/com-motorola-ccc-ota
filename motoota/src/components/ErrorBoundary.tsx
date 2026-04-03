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

  render() {
    if (this.state.hasError) {
      return (
        <div className="flex min-h-screen items-center justify-center bg-[#0a0a14] p-6">
          <div className="max-w-md space-y-4 rounded-2xl border border-red-500/20 bg-red-500/5 p-6 text-center">
            <h2 className="text-lg font-semibold text-red-400">Algo salió mal</h2>
            <p className="text-sm text-gray-400">{this.state.error?.message}</p>
            <button
              onClick={() => {
                this.setState({ hasError: false, error: null });
                window.location.reload();
              }}
              className="rounded-xl bg-red-500/20 px-6 py-2 text-sm font-medium text-red-300 transition-colors hover:bg-red-500/30"
            >
              Recargar aplicación
            </button>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary;
