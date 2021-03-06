import React, { useEffect, useState } from "react";

import { PageLoader } from "@bigbinary/neetoui/v2";

import { setAuthHeaders, registerIntercepts } from "apis/axios";
import { initializeLogger } from "common/logger";
import Main from "components/Main";
import { ArticleProvider } from "contexts/articles";
import { CategoryProvider } from "contexts/categories";

const App = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    initializeLogger();
    registerIntercepts();
    setAuthHeaders(setLoading);
  }, []);

  if (loading) {
    return (
      <div className="py-10">
        <PageLoader />
      </div>
    );
  }

  return (
    <CategoryProvider>
      <ArticleProvider>
        <Main />
      </ArticleProvider>
    </CategoryProvider>
  );
};

export default App;
