using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Security;

/// <summary>
/// Descripción breve de Ssl
/// </summary>
public static class Ssl
{
    private static readonly string[] TrustedHosts = new[] {
      "web.cre8sms.com", 
      "host2.domain.com"
    };

    public static void EnableTrustedHosts()
    {
        ServicePointManager.ServerCertificateValidationCallback =
        (sender, certificate, chain, errors) =>
        {
            if (errors == SslPolicyErrors.None)
            {
                return true;
            }

            var request = sender as HttpWebRequest;
            if (request != null)
            {
                return TrustedHosts.Contains(request.RequestUri.Host);
            }

            return false;
        };
    }
}