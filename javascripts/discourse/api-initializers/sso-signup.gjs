import { apiInitializer } from "discourse/lib/api";
import DButton from "discourse/components/d-button";
import getURL from "discourse-common/lib/get-url";
import { i18n } from "discourse-i18n";

export default apiInitializer("1.14.0", (api) => {
  const currentUser = api.getCurrentUser();
  const siteSettings = api.container.lookup("service:site-settings");

  const signUpSsoButton = <template>
    <DButton
      class="btn-primary btn-small sign-up-button sso-signup-button"
      @translatedLabel={{i18n "js.sign_up"}}
      @href={{getURL settings.sso_signup_url}}
    />
  </template>

  if (!currentUser && siteSettings.enable_discourse_connect) {
    api.headerButtons.add(
      "sso-signup",
      signUpSsoButton,
      { before: "auth" }
    )
  }
});
