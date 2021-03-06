defmodule Staxx.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  defp releases() do
    [
      staxx: [
        include_executables_for: [:unix],
        applications: [
          runtime_tools: :permanent,
          deployment_scope: :permanent,
          docker: :permanent,
          event_stream: :permanent,
          metrix: :permanent,
          proxy: :permanent,
          web_api: :permanent,
          ex_chain: :load
        ]
      ],
      ex_testchain: [
        include_executables_for: [:unix],
        applications: [
          ex_chain: :permanent,
          json_rpc: :permanent,
          storage: :permanent
        ]
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:telemetry, "~> 0.4"}
    ]
  end
end
