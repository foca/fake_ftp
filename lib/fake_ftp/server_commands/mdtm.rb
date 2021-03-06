# frozen_string_literal: true

module FakeFtp
  module ServerCommands
    class Mdtm
      def run(ctx, filename = '', *)
        ctx.respond_with('501 No filename given') && return if filename.empty?
        server_file = ctx.file(filename)
        ctx.respond_with('550 File not found') && return if server_file.nil?

        ctx.respond_with(
          "213 #{server_file.last_modified_time.strftime('%Y%m%d%H%M%S')}"
        )
      end
    end
  end
end
