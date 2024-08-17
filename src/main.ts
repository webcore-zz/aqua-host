import { loadManifest } from "@angular-architects/module-federation";
import { environment } from "./environments/environment";

const manifest = environment.production
  ? "mf.manifest.prod.json"
  : "mf.manifest.json";

loadManifest(`/assets/${manifest}`)
  .catch((err) => console.error(err))
  .then((_) => import("./bootstrap"))
  .catch((err) => console.error(err));
